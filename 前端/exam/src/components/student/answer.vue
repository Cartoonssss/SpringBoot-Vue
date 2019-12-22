<!--考生答题界面-->
<template>
  <div id="answer">
    <!--顶部信息栏-->
    <div class="top">
      <ul class="item">
        <li>
          <i class="iconfont icon-menufold icon20" ref="toggle" @click="display()"></i>
        </li>
        <li>{{examData.type}}-{{examData.source}}</li>
        <li @click="flag = !flag">
          <i class="iconfont icon-user icon20"></i>
          <div class="msg" v-if="flag" @click="flag = !flag">
            <p>姓名：{{userInfo.name}}</p>
            <p>准考证号: {{userInfo.id}}</p>
          </div>
        </li>
        <li>
          <i class="iconfont icon-arrLeft icon20"></i>
        </li>
      </ul>
    </div>
    <div class="flexarea">
      <!--左边题目编号区-->
      <transition name="slider-fade">
        <div class="left" v-if="slider_flag">
          <ul class="l-top">
            <li>
              <a href="javascript:;"></a>
              <span>当前</span>
            </li>
            <li>
              <a href="javascript:;"></a>
              <span>未答</span>
            </li>
            <li>
              <a href="javascript:;"></a>
              <span>已答</span>
            </li>
          </ul>
          <div class="l-bottom">
            <div class="item">
              <p>选择题部分</p>
              <ul>
                <li v-for="(list, index1) in topic[1]" :key="index1">
                  <a
                    href="javascript:;"
                    @click="change(index1)"
                    :class="{'border': index == index1 && currentType == 1,'bg': bg_flag && topic[1][index1].isClick == true}"
                  >
                    <span :class="{'mark': topic[1][index1].isMark == true}"></span>
                    {{index1+1}}
                  </a>
                </li>
              </ul>
            </div>
            <div class="item">
              <p>填空题部分</p>
              <ul>
                <li v-for="(list, index2) in topic[2]" :key="index2">
                  <a
                    href="javascript:;"
                    @click="fill(index2)"
                    :class="{'border': index == index2 && currentType == 2,'bg': fillAnswer[index2][3] == true}"
                  >
                    <span :class="{'mark': topic[2][index2].isMark == true}"></span>
                    {{topicCount[0]+index2+1}}
                  </a>
                </li>
              </ul>
            </div>
            <div class="item">
              <p>判断题部分</p>
              <ul>
                <li v-for="(list, index3) in topic[3]" :key="index3">
                  <a
                    href="javascript:;"
                    @click="judge(index3)"
                    :class="{'border': index == index3 && currentType == 3,'bg': bg_flag && topic[3][index3].isClick == true}"
                  >
                    <span :class="{'mark': topic[3][index3].isMark == true}"></span>
                    {{topicCount[0]+topicCount[1]+index3+1}}
                  </a>
                </li>
              </ul>
            </div>
            <div class="final" @click="commit()">结束考试</div>
          </div>
        </div>
      </transition>
      <!-- 模块之间的连接开始-->
      <div class="lines">
        <ul class="lis">
          <li v-show="flag1"></li>
          <li v-show="flag1"></li>
          <li v-show="flag1"></li>
          <li v-show="flag1"></li>
          
        </ul>
        <div class="circle">
          <span v-show="flag1"></span>
          <span v-show="flag1"></span>
          <span v-show="flag1"></span>
          <span v-show="flag1"></span>
          <span v-show="flag1"></span>
          <span v-show="flag1"></span>
          <span v-show="flag1"></span>
          <span v-show="flag1"></span>
         
        </div>
      </div>
      <!-- 模块之间的连接结束 -->
      <!--右边选择答题区-->
      <transition name="slider-fade">
        <div class="right">
          <!-- 右边头部开始-->
          <div class="title">
            <p>{{title}}</p>
            <i class="iconfont icon-right auto-right"></i>
            <span>
              全卷共{{topicCount[0] + topicCount[1] + topicCount[2]}}题
              <i class="iconfont icon-time"></i>倒计时：
              <b>
                <span v-show="hflag">0</span>
                {{h}}:
                <span v-show="mflag">0</span>
                {{m}}:
                <span v-show="sflag">0</span>
                {{s}}
              </b>
            </span>
          </div>
          <!-- 右边头部结束-->
          <!-- 右边内容开始-->
          <div class="content">
            <p class="topic">
              <span class="number">{{number}}</span>
              {{showQuestion}}
            </p>
            <div v-if="currentType == 1">
              <el-radio-group v-model="radio[index]" @change="getChangeLabel">
                <el-radio :label="1">(A) {{showAnswer.answerA}}</el-radio>
                <el-radio :label="2">(B) {{showAnswer.answerB}}</el-radio>
                <el-radio :label="3">(C) {{showAnswer.answerC}}</el-radio>
                <el-radio :label="4">(D) {{showAnswer.answerD}}</el-radio>
              </el-radio-group>
             
            </div>
            <div class="fill" v-if="currentType == 2">
              <div v-for="(item,currentIndex) in part" :key="currentIndex">
                <el-input
                  placeholder="请填在此处"
                  v-model="fillAnswer[index][currentIndex]"
                  clearable
                  @blur="fillBG"
                ></el-input>
              </div>
             
            </div>
            <div class="judge" v-if="currentType == 3">
              <el-radio-group
                v-model="judgeAnswer[index]"
                @change="getJudgeLabel"
                v-if="currentType == 3"
              >
                <el-radio :label="1">正确</el-radio>
                <el-radio :label="2">错误</el-radio>
              </el-radio-group>
              
            </div>
          </div>
          <!-- 右边内容开始-->
          <!-- 右边切换上下题开始-->
          <div class="operation">
            <ul class="end">
              <li @click="previous()">
                <i class="iconfont icon-previous"></i>
                <span>上一题</span>
              </li>
              <li>
                <i class="iconfont icon-mark-o"></i>
              </li>
              <li @click="next()">
                <span>下一题</span>
                <i class="iconfont icon-next"></i>
              </li>
            </ul>
          </div>
          <!-- 右边切换上下题结束-->
        </div>
      </transition>
    </div>
  </div>
</template>

<script>
import store from "@/vuex/store";
import { mapState } from "vuex";
export default {
  store,
  data() {
    return {
      hflag: false, //小时
      mflag: false, //分钟
      sflag: false, //秒
      h: null,
      m: null,
      s: null,
      startTime: null, //考试开始时间
      endTime: null, //考试结束时间
      time: null, //考试持续时间
      reduceAnswer: [], //vue官方不支持3层以上数据嵌套,如嵌套则会数据渲染出现问题,此变量直接接收3层嵌套时的数据。
      answerScore: 0, //答题总分数
      bg_flag: false, //已答标识符,已答改变背景色
      isFillClick: false, //选择题是否点击标识符
      slider_flag: true, //左侧显示隐藏标识符
      flag: false, //个人信息显示隐藏标识符
      flag1:true,//模块是否连接
      currentType: 1, //当前题型类型  1--选择题  2--填空题  3--判断题
      radio: [], //保存考生所有选择题的选项
      title: "请选择正确的选项",
      index: 0, //全局index
      userInfo: {
        //用户信息
        name: null,
        id: null
      },
      topicCount: [], //每种类型题目的总数
      score: [], //每种类型分数的总数
      examData: {
        //考试信息
        // source: null,
        // totalScore: null,
      },
      topic: {
        //试卷信息
      },
      showQuestion: [], //当前显示题目信息
      showAnswer: {}, //当前题目对应的答案选项
      number: 1, //题号
      part: null, //填空题的空格数量
      fillAnswer: [[]], //二维数组保存所有填空题答案
      judgeAnswer: [], //保存所有判断题答案
      topic1Answer: [], //学生选择题作答编号,
      rightAnswer: "",//数据库正确答案
     
     
    };
  },

  created() {
    this.getCookies();
    this.getExamData();
  },

  methods: {
    //显示和连接模块
    display(){
      this.slider_flag = !this.slider_flag
      this.flag1 = !this.flag1
    },
    getTime(date) {
      //日期格式化
      let year = date.getFullYear();
      let month =
        date.getMonth() + 1 < 10
          ? "0" + (date.getMonth() + 1)
          : date.getMonth() + 1;
      let day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
      let hours =
        date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
      let minutes =
        date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
      let seconds =
        date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
      // 拼接
      return (
        year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds
      );
    },
    getCookies() {
      //获取cookie
      this.userInfo.name = this.$cookies.get("studentName");
      this.userInfo.id = this.$cookies.get("studentId");
    },
    getExamData() {
      //获取当前试卷所有信息
      let date = new Date();
      this.startTime = this.getTime(date); //得到当前已经格式化的日期
      let examCode = this.$route.query.examCode; //获取路由传递过来的试卷编号
      this.$axios(`/api/exam/${examCode}`).then(res => {
        //通过examCode请求试卷详细信息
        //解构赋值,将获得的数据数组解开一个个参数
        this.examData = { ...res.data.data }; //获取考试详情
        //  console.log(this.examData);
        
        this.index = 0;
        this.time = this.examData.totalTime; //获取分钟数
        this.showTime();
        let paperId = this.examData.paperId;
        this.$axios(`/api/paper/${paperId}`).then(res => {
          //通过paperId获取试题题目信息
          this.topic = { ...res.data };
          // console.log(this.topic[1][1]);//一个选择题的所有相关信息
          
          let reduceAnswer = this.topic[1][this.index];
          this.reduceAnswer = reduceAnswer;
          let keys = Object.keys(this.topic); //对象转数组
          keys.forEach(e => {
            let data = this.topic[e];
            this.topicCount.push(data.length);
            let currentScore = 0;
            for (let i = 0; i < data.length; i++) {
              //循环每种题型,计算出总分
              currentScore += data[i].score;
            }
            this.score.push(currentScore); //把每种题型总分存入score
          });
          let len = this.topicCount[1];//填空题的题数
          let father = [];
          for (let i = 0; i < len; i++) {
            //根据填空题数量创建二维空数组存放每道题答案
            let children = [null, null, null, null];
            father.push(children);
          }
          this.fillAnswer = father;//二维数组保存所有填空题答案
          let dataInit = this.topic[1];
          // console.log(this.topic.length);
          this.number = 1;//题号
          this.showQuestion = dataInit[0].question;
          this.showAnswer = dataInit[0];
        });
      });
    },
    change(index) {
      //1.选择题
      this.index = index;
      let reduceAnswer = this.topic[1][this.index];
      this.reduceAnswer = reduceAnswer;
      this.isFillClick = true;
      this.currentType = 1;
      let len = this.topic[1].length;
      if (this.index < len) {
        if (this.index <= 0) {
          this.index = 0;
        }
        console.log(`总长度${len}`);
        console.log(`当前index:${index}`);
        this.title = "请选择正确的选项";
        let Data = this.topic[1];
        // console.log(Data)
        this.showQuestion = Data[this.index].question; //获取题目信息
        this.showAnswer = Data[this.index];
        this.number = this.index + 1;
      } else if (this.index >= len) {
        this.index = 0;
        this.fill(this.index);
      }
    },
   
    fill(index) {
      //2.填空题
      let len = this.topic[2].length;
      this.currentType = 2;
      this.index = index;
      if (index < len) {
        if (index < 0) {
          index = this.topic[1].length - 1;
          this.change(index);
        } else {
          console.log(`总长度${len}`);
          console.log(`当前index:${index}`);
          this.title = "请在方框处填写答案";
          let Data = this.topic[2];
          console.log(Data);
          this.showQuestion = Data[index].question; //获取题目信息
          //判断填空题所填答案处是__还是（）
          let part = this.showQuestion.includes("()")
            ? this.showQuestion.split("()").length - 1
            : this.showQuestion.split("_________").length - 1;
          // let part= this.showQuestion.split("()").length -1 //根据题目中括号的数量确定填空横线数量
          this.part = part;
          this.number = this.topicCount[0] + index + 1;
        }
      } else if (index >= len) {
        this.index = 0;
        this.judge(this.index);
      }
    },
     fillBG() {
      //填空题已答题目 如果已答该题目,设置第四个元素为true为标识符
      if (this.fillAnswer[this.index][this.part - 1] != null) {
        this.fillAnswer[this.index][3] = true;
       this.next()
      }
     
    },
    judge(index) {
      //3.判断题
      let len = this.topic[3].length;
      this.currentType = 3;
      this.index = index;
      if (this.index < len) {
        if (this.index < 0) {
          this.index = this.topic[2].length - 1;
          this.fill(this.index);
        } else {
          console.log(`总长度${len}`);
          console.log(`当前index:${this.index}`);
          this.title = "请作出正确判断";
          let Data = this.topic[3];
          console.log(Data);
          this.showQuestion = Data[index].question; //获取题目信息
          //题号等于前面的选择题数量+填空题数量+index+1
          this.number = this.topicCount[0] + this.topicCount[1] + index + 1;
        }
      } else if (this.index >= len) {
        this.index = 0;
        this.change(this.index);
      }
    },
    getChangeLabel(val) {
      //获取1.选择题作答选项
      this.radio[this.index] = val; //当前选择的序号
      if (val) {
        let data = this.topic[1];
        this.bg_flag = true;
        data[this.index]["isClick"] = true;
      }
      /* 保存学生答题选项 */
      this.topic1Answer[this.index] = val;
      this.next();
    },
    getJudgeLabel(val) {
      //获取3.判断题作答选项
      this.judgeAnswer[this.index] = val;
      if (val) {
        let data = this.topic[3];
        this.bg_flag = true;
        data[this.index]["isClick"] = true;
      }
      /* 保存学生答题选项 */
      this.judgeAnswer[this.index] = val;
      this.next();
    },
    previous() {
      //上一题
      this.index--;
      switch (this.currentType) {
        case 1:
          this.change(this.index);
          break;
        case 2:
          this.fill(this.index);
          break;
        case 3:
          this.judge(this.index);
          break;
      }
    },
    next() {
      //下一题
      this.index++;
      switch (this.currentType) {
        case 1:
          this.change(this.index);
          break;
        case 2:
          this.fill(this.index);
          break;
        case 3:
          this.judge(this.index);
          break;
      }
    },
   autoCommit(){
     //自动提交后计算分数
      /* 1.计算选择题总分 */
      let topic1Answer = this.topic1Answer;
      let finalScore = 0;
      topic1Answer.forEach((element, index) => {
        //循环每道选择题根据选项计算分数
        let right = null;
        if (element != null) {
          switch (
            element //选项1,2,3,4 转换为 "A","B","C","D"
          ) {
            case 1:
              right = "A";
              break;
            case 2:
              right = "B";
              break;
            case 3:
              right = "C";
              break;
            case 4:
              right = "D";
          }
          if (right == this.topic[1][index].rightAnswer) {
            // 当前选项与正确答案对比
            finalScore += this.topic[1][index].score; // 计算总分数
          }
          console.log(right, this.topic[1][index].rightAnswer);
        }
        // console.log(topic1Answer)
      });
      /**2、计算填空题总分 */
      // console.log(`this.fillAnswer${this.fillAnswer}`)
      // console.log(this.topic[2][this.index])
      let fillAnswer = this.fillAnswer;
      fillAnswer.forEach((element, index) => {
        //此处index和 this.index数据不一致
        element.forEach(inner => {
          //要求填的每一项都要与相应答案一样，一旦有错该题不得分，问题是如果有多个空，答题可以把顺序调换
          if (this.topic[2][index].answer === inner) {
            //判断填空答案是否与数据库一致
            console.log("正确");
            finalScore += this.topic[2][this.index].score;
          }
        });
      });
      /**3.计算判断题总分 */
      let topic3Answer = this.judgeAnswer;
      topic3Answer.forEach((element, index) => {
        let right = null;
        switch (element) {
          case 1:
            right = "T";
            break;
          case 2:
            right = "F";
        }
        if (right == this.topic[3][index].answer) {
          // 当前选项与正确答案对比
          finalScore += this.topic[3][index].score; // 计算总分数
        }
      });
      console.log(`目前总分${finalScore}`);
     
     
            this.$message('考试时间到，自动交卷！！');
            let date = new Date();
            this.endTime = this.getTime(date);
            let answerDate = this.endTime.substr(0, 10);
            //提交成绩信息
            this.$axios({
              url: "/api/score",
              method: "post",
              data: {
                examCode: this.examData.examCode, //考试编号
                studentId: this.userInfo.id, //学号
                subject: this.examData.source, //课程名称
                etScore: finalScore, //答题成绩
                answerDate: answerDate //答题日期
              }
            }).then(res => {
              if (res.data.code == 200) {
                this.$router.push({
                  path: "/studentScore",
                  query: {
                    score: finalScore,
                    startTime: this.startTime,
                    endTime: this.endTime,
                    source: this.examData.source,
                    totalScore: this.score[0] + this.score[1] + this.score[2],
                    totalTime: this.examData.totalTime
                  }
                });
              }
            });

    },
  
    commit() {
      //答案提交计算分数
      /* 1.计算选择题总分 */
      let topic1Answer = this.topic1Answer;
      let finalScore = 0;
      topic1Answer.forEach((element, index) => {
        //循环每道选择题根据选项计算分数
        let right = null;
        if (element != null) {
          switch (
            element //选项1,2,3,4 转换为 "A","B","C","D"
          ) {
            case 1:
              right = "A";
              break;
            case 2:
              right = "B";
              break;
            case 3:
              right = "C";
              break;
            case 4:
              right = "D";
          }
          if (right == this.topic[1][index].rightAnswer) {
            // 当前选项与正确答案对比
            finalScore += this.topic[1][index].score; // 计算总分数
          }
          console.log(right, this.topic[1][index].rightAnswer);
        }
        // console.log(topic1Answer)
      });
      /**2、计算填空题总分 */
      // console.log(`this.fillAnswer${this.fillAnswer}`)
      // console.log(this.topic[2][this.index])
      let fillAnswer = this.fillAnswer;
      fillAnswer.forEach((element, index) => {
        //此处index和 this.index数据不一致
        element.forEach(inner => {
          //要求填的每一项都要与相应答案一样，一旦有错该题不得分，问题是如果有多个空，答题可以把顺序调换
          if (this.topic[2][index].answer === inner) {
            //判断填空答案是否与数据库一致
            console.log("正确");
            finalScore += this.topic[2][this.index].score;
          }
        });
      });
      /**3.计算判断题总分 */
      let topic3Answer = this.judgeAnswer;
      topic3Answer.forEach((element, index) => {
        let right = null;
        switch (element) {
          case 1:
            right = "T";
            break;
          case 2:
            right = "F";
        }
        if (right == this.topic[3][index].answer) {
          // 当前选项与正确答案对比
          finalScore += this.topic[3][index].score; // 计算总分数
        }
      });
      console.log(`目前总分${finalScore}`);
      if (this.time != 0) {
        this.$confirm("考试结束时间未到,是否提前交卷", "友情提示", {
          confirmButtonText: "立即交卷",
          cancelButtonText: "再检查一下",
          type: "warning"
        })
          .then(() => {
            console.log("交卷");
            let date = new Date();
            this.endTime = this.getTime(date);
            let answerDate = this.endTime.substr(0, 10);
            //提交成绩信息
            this.$axios({
              url: "/api/score",
              method: "post",
              data: {
                examCode: this.examData.examCode, //考试编号
                studentId: this.userInfo.id, //学号
                subject: this.examData.source, //课程名称
                etScore: finalScore, //答题成绩
                answerDate: answerDate //答题日期
              }
            }).then(res => {
              if (res.data.code == 200) {
                this.$router.push({
                  path: "/studentScore",
                  query: {
                    score: finalScore,
                    startTime: this.startTime,
                    endTime: this.endTime,
                    source: this.examData.source,
                    totalScore: this.score[0] + this.score[1] + this.score[2],
                    totalTime: this.examData.totalTime
                  }
                });
              }
            });
          })
          .catch(() => {
            console.log("继续答题");
          });
      }
    },
    showTime() {
      //倒计时
      //alert(this.time)
      var h = Math.floor((this.time % (60 * 60)) / 60);
      this.h = h;
      var m = parseInt((this.time % (60 * 60)) % 60);
      this.m = m;
      var s = Math.floor(this.time / (60 * 60));
      this.s = s;
      var count = 0;
     let time = this.time * 60;
      var times = setInterval(() => {
        time -= 1;
        this.s--;
        count += 1;
        if (this.s < 0) {
          this.s = 59;
          this.m = this.m - 1;
        }
        if (this.s < 10) {
          this.sflag = true;
        } else {
          this.sflag = false;
        }
        if (this.m < 0) {
          this.m = 59;
          this.h = this.h - 1;
        }
        if (this.m < 10) {
          this.mflag = true;
        } else {
          this.mflag = false;
        }
        if (this.h < 10) {
          this.hflag = true;
        } else {
          this.hflag = false;
        }
        if (time == 10 * 60) {
          this.$message({
            showClose: true,
            type: "error",
            message: "考生注意,考试时间还剩10分钟！！！"
          });
        }
        if (time == 0) {
          console.log("考试时间已到,强制交卷。");
          clearInterval(times);
          
          this.autoCommit();
					times = null
          
        }
      }, 1000);
    }
  }
};
</script>
<style lang="scss">
.red {
  background: red;
}
.lis {
  li {
    display: block;
    width: 30px;
    height: 8px;
    border-radius: 5px;
    background-color: #92a3fb;
    z-index: 999;
    position: absolute;
  }
  li:nth-child(1) {
    left: 258px;
    top: 110px;
  }
  li:nth-child(2) {
    left: 258px;
    top: 230px;
  }
  li:nth-child(3) {
    left: 258px;
    top: 370px;
  }
  li:nth-child(4) {
    left: 258px;
    top: 510px;
  }
}
.circle span {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: #3859fe;
  position: absolute;
  z-index: 998;
}
.circle span:nth-child(1) {
  left: 255px;
  top: 110px;
}
.circle span:nth-child(2) {
  left: 281px;
  top: 110px;
}
.circle span:nth-child(3) {
  left: 255px;
  top: 230px;
}
.circle span:nth-child(4) {
  left: 281px;
  top: 230px;
}
.circle span:nth-child(5) {
  left: 255px;
  top: 370px;
}
.circle span:nth-child(6) {
  left: 281px;
  top: 370px;
}
.circle span:nth-child(7) {
  left: 255px;
  top: 510px;
}
.circle span:nth-child(8) {
  left: 281px;
  top: 510px;
}
.iconfont.icon-time {
  color: #2776df;
  margin: 0px 6px 0px 20px;
}

.mark {
  position: absolute;
  width: 4px;
  height: 4px;
  content: "";
  background-color: red;
  border-radius: 50%;
  top: 0px;
  left: 22px;
}
.border {
  position: relative;
  border: 1px solid #ff90aa !important;
}
.bg {
  background-color: #5188b8 !important;
}
.fill .el-input {
  display: inline-flex;
  width: 150px;
  margin-left: 20px;
  .el-input__inner {
    border: 1px solid transparent;
    border-bottom: 1px solid #eee;
    padding-left: 20px;
  }
}
/* slider过渡效果 */
.slider-fade-enter-active {
  transition: all 0.3s ease;
}
.slider-fade-leave-active {
  transition: all 0.3s cubic-bezier(1, 0.5, 0.8, 1);
}
.slider-fade-enter,
.slider-fade-leave-to {
  transform: translateX(-100px);
  opacity: 0;
}

.operation .end li:nth-child(2) {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: rgb(39, 118, 223);
  border-radius: 50%;
  width: 50px;
  height: 50px;
  color: #fff;
}
.operation .end li {
  cursor: pointer;
  margin: 0 100px;
}
.operation {
  background-color: #fff;
  border-radius: 4px;
  padding: 10px 0px;
  margin-right: 10px;
}
.operation .end {
  display: flex;
  justify-content: center;
  align-items: center;
  color: rgb(39, 118, 223);
  box-shadow: 0px 0px 10px #3859fe inset;
}
.content .number {
  display: inline-flex;
  justify-content: center;
  align-items: center;
  width: 20px;
  height: 20px;
  background-color: rgb(39, 118, 223);
  border-radius: 4px;
  margin-right: 4px;
}
.content {
  padding: 15px 60px;
  font-size: 20px;
}
.content .topic {
  padding: 20px 0px;
  padding-top: 30px;
}
.right .content {
  // background:-webkit-gradient(linear, 0% 0%, 0% 100%,from(#f6f6f8), to(#3859FE));
  box-shadow: 0px 0px 30px #3859fe inset;
  margin: 10px;
  margin-left: 0px;
  height: 470px;
}
.content .el-radio-group label {
  color: #000;
  margin: 10px 0px;
  font-size: 18px !important;
}
.content .el-radio-group {
  display: flex;
  flex-direction: column;
}
.right .title {
  box-shadow: 0px 0px 10px #3859fe inset;
  p {
    margin-left: 20px;
  }
}
.flexarea {
  display: flex;
  position: relative;
}
.flexarea .right {
  flex: 1;
}
.auto-right {
  margin-left: auto;
  color: #2776df;
  margin-right: 10px;
}
.right .title {
  margin-right: 10px;
  padding-right: 30px;
  display: flex;
  margin-top: 10px;
  background-color: #fff;
  height: 50px;
  line-height: 50px;
}
.clearfix {
  clear: both;
}
.l-bottom .final {
  cursor: pointer;
  display: inline-block;
  text-align: center;
  background-color: rgb(39, 118, 223);
  width: 240px;
  margin: 20px 0px 20px 10px;
  border-radius: 4px;
  height: 30px;
  line-height: 30px;
  color: #fff;
  margin-top: 22px;
}
#answer .left .item {
  padding: 10px;
  font-size: 16px;
}
.l-bottom {
  border-radius: 4px;
  box-shadow: 0px 0px 10px #3859fe inset;
}
.l-bottom .item p {
  margin-bottom: 15px;
  margin-top: 10px;
  color: #000;
  margin-left: 10px;
  letter-spacing: 2px;
}
.l-bottom .item li {
  width: 15%;
  margin-left: 5px;
  margin-bottom: 10px;
}
.l-bottom .item {
  display: flex;
  flex-direction: column;
}
.l-bottom .item ul {
  width: 100%;
  margin-bottom: -8px;
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
.l-bottom .item ul li a {
  position: relative;
  justify-content: center;
  display: inline-flex;
  align-items: center;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  background-color: #fff;
  border: 1px solid #eee;
  text-align: center;
  color: #000;
  font-size: 16px;
}
.left .l-top {
  display: flex;
  justify-content: space-around;
  padding: 16px 0px;
  border: 1px solid #eee;
  border-radius: 4px;
  margin-bottom: 10px;
  background-color: #fff;
  box-shadow: 0px 0px 10px #3859fe inset;
}
.left {
  width: 260px;
  height: 100%;
  margin: 10px 10px 0px 10px;
}
.left .l-top li:nth-child(2) a {
  border: 1px solid #eee;
}
.left .l-top li:nth-child(3) a {
  background-color: #5188b8;
  border: none;
}
.left .l-top li:nth-child(4) a {
  position: relative;
  border: 1px solid #eee;
}
.left .l-top li:nth-child(4) a::before {
  width: 4px;
  height: 4px;
  content: " ";
  position: absolute;
  background-color: red;
  border-radius: 50%;
  top: 0px;
  left: 16px;
}
.left .l-top li {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
.left .l-top li a {
  display: inline-block;
  padding: 10px;
  border-radius: 50%;
  background-color: #fff;
  border: 1px solid #ff90aa;
}
#answer .top {
  background-color: rgb(39, 118, 223);
}
#answer .item {
  color: #fff;
  display: flex;
  padding: 20px;
  font-size: 20px;
}
#answer .top .item li:nth-child(1) {
  margin-right: 10px;
}
#answer .top .item li:nth-child(3) {
  position: relative;
  margin-left: auto;
}
#answer {
  padding-bottom: 30px;
}
.icon20 {
  font-size: 20px;
  font-weight: bold;
}
.item .msg {
  padding: 10px 15px;
  border-radius: 4px;
  top: 47px;
  right: -30px;
  color: #6c757d;
  position: absolute;
  border: 1px solid rgba(0, 0, 0, 0.15);
  background-color: #fff;
  z-index: 99;
}
.item .msg p {
  font-size: 16px;
  width: 200px;
  text-align: left;
}
</style>
