<template>
  <div class="part" >
    <div class="box" ref="box"></div>
    <div v-if="isNull">
      <div class="tip">
        <div class="title">温馨提示</div>
        <div class="bottom el-icon-warning">该门考试还没人参考哦,请提醒学生参加考试。</div>

      </div>
     
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isNull: false, //是否有成绩标志位
      name: null,
      category: { //保存分数段
        '90分及以上': 0,
        '80-89分': 0,
        '70-79分': 0,
        '60-69分': 0,
        '60分以下': 0,
      }
    }
  },
  created() {
    this.getScoreInfo()

  },
  methods: {
    getScoreInfo() {
      let examCode = this.$route.query.examCode
      this.name = this.$route.query.source
      this.$axios(`/api/scores/${examCode}`).then(res => {
        let data = res.data.data
        if(data.length > 0) {
          let box = this.$refs['box']
          let charts = this.$echarts.init(box)
          data.forEach(element => {
            switch(element.etScore / 10) {
              case 10:
              case 9:
                this.category["90分及以上"]++
                break
              case 8:
                this.category['80-89分']++
                break
              case 7:
                this.category["70-79分"]++
                break
              case 6:
                this.category['60-69分']++
                break
              default:
                this.category['60分以下']++
            }
          });
          let option = {
              title : {
                  text: `${this.name}分数段图`,
                  subtext: '分数段饼图',
                  x:'center'
              },
              tooltip : {
                  trigger: 'item',
                  formatter: "{a}：{b} <br/> {c}人 ({d}%)"
              },
              legend: {
                  orient: 'vertical',
                  left: 'left',
                  data: ['90分及以上','80-89分','70-79分','60-69分','60分以下']
              },
              series : [
                  {
                      name: '分数段',
                      type: 'pie',
                      radius : '35%',
                      center: ['50%', '35%'],
                      data:[
                          {value:this.category['90分及以上'], name:'90分及以上'},
                          {value:this.category['80-89分'], name:'80-89分'},
                          {value:this.category['70-79分'], name:'70-79分'},
                          {value:this.category['60-69分'], name:'60-69分'},
                          {value:this.category['60分以下'], name:'60分以下'}
                      ],
                      itemStyle: {
                          emphasis: {
                              shadowBlur: 10,
                              shadowOffsetX: 0,
                              shadowColor: 'rgba(0, 0, 0, 0.5)'
                          }
                      }
                  }
              ]
          };
          charts.setOption(option)
        }else {
          this.isNull = true
        }
      })
    }
  },

}
</script>

<style lang="scss" scoped>
.part {
 position: relative;
  .box {
    width: 800px;
    height: 800px;
    margin-left: 40px;
  }
  .tip{
    position: absolute;
    z-index: 1000;
    width: 100%;
    height: 100%;
   
    top: 0px;
    left: 0px;
    background: url('../../assets/img/tips.png') no-repeat;
    background-size: contain;
 
  justify-content: center;
  align-items: center;
 
.title{
 
  position: absolute;
  width: 300px;
  height: 100px;
  left: 450px;
  top: 120px;
  font-size: 70px;
  color: #FFE3CB;
  letter-spacing: 5px;
}
.bottom {
  position: absolute;
  width: 800px;
  height: 100px;
  left: 250px;
  top: 230px;
  font-size: 50px;
  color: red;
  letter-spacing: 5px;
}
}
}

</style>


