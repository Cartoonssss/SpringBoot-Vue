<!--页脚部分-->
<template>
  <footer id="footer">
    <ul>
      <li><a href="http://www.pxc.jx.cn/">萍乡学院</a></li>
      <li><a href="javascript:;">联系电话：18779914075</a></li>
      <li><a href="javascript:;">地址：江西省萍乡市萍安北大道211号</a></li>
    </ul>
  </footer>
</template>

<script>
export default {
  name: "myFooter"
}
</script>

<style scoped>
#footer a {
  color: #919698;
  font-size: 14px;
}
#footer {
  background-color: #eee;
}
#footer ul {
  margin-top: 40px;
  border-top: 1px solid #d5d5d5;
  display: flex;
  justify-content: center;
  height: 80px;
  line-height: 80px;
}
#footer ul li {
  color: #919698;
  font-size: 14px;
  margin-right: 20px;
}
</style>
