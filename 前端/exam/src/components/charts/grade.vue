// 成绩统计页面
<template>
  <div id="grade">
    <div ref="box" class="box"></div>
    <div class="notFound" v-if="isNull">
      <i class="iconfont icon-LC_icon_tips_fill"></i><span>该考生未参加考试</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "grade",
  data() {
    return {
      isNull: false, //原始数据
      tableDataX: [], //x轴数据 保存次数
      tableDataY: [], //y轴数据 保存分数
    }
  },
  mounted() {
    this.score();
  },
  methods: {
    score() {
      let studentId = this.$route.query.studentId
     
      
      this.$axios(`/api/score/${studentId}`).then(res => { //根据学生Id查询成绩
        // console.log(res)
        if(res.data.code == 200) {
          let rootData = res.data.data
          // console.log("rootDaata"+rootData);
          
          rootData.forEach((element,index) => {//`第${index + 1}次`
          // let x=this.colum(element.subject)+this.colum(element.answerDate)
          
            this.tableDataX.push(element.subject+`第${index + 1}次`)//+`第${index + 1}次`
            this.tableDataY.push(element.etScore)
          });
          let boxDom = this.$refs["box"];
          //基于准备好的dom，初始化echarts实例
          let scoreCharts = this.$echarts.init(boxDom);
          let option = {
           
            grid:{ //控制图表到顶部与底部的距离
        //top:'20%',
        left:'10%',
        bottom:'50%'
    },
            xAxis: {
              type: "category",
              data: this.tableDataX,
              axisPointer: {
                type: 'shadow'
            },
              axisLabel: { //X轴文字竖着显示
               interval: 0,
               formatter:function(value)
               {
                   return value.split("").join("\n");
               }
            }
            },
            yAxis: {
              type: "value"
            },
            series: [
              {
                data: this.tableDataY,
                type: "line",
                itemStyle: { normal: { label: { show: true } } }
              }
            ]
          };
          //绘制图表
          scoreCharts.setOption(option);
          scoreCharts.on("mouseover", params => {
            console.log(params.value);
          });
        }else {
          this.isNull = true
        }
      })
    },
   /*  colum(val){
     return val.split('').join('\n') 
}  */
    }
  
};
</script>

<style lang="scss" scoped>
#grade {
  position: relative;
  .box{
    width: 600px;
    height: 600px;
  }
  .notFound {
    position: absolute;
    top: 0px;
    left: 0px;
  }
}
</style>
