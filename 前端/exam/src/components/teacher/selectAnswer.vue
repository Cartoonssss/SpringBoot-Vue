//查询所有题库
<template>
  <div class="exam">
    <el-table :data="pagination.records" border :row-class-name="tableRowClassName">
      <el-table-column fixed="left" prop="subject" label="试卷名称" width="180"></el-table-column>
      <el-table-column prop="question" label="题目信息" width="490"></el-table-column>
      <el-table-column prop="section" label="所属章节" width="200"></el-table-column>
      <el-table-column prop="type" label="题目类型" width="200"></el-table-column>
      <el-table-column prop="score" label="试题分数" width="150"></el-table-column>
      <el-table-column prop="level" label="难度等级" width="133"></el-table-column>
      <el-table-column fixed="right" label="操作" width="150">
        <template slot-scope="scope">
          <el-button @click="edit(scope.row.questionId,scope.row.type)" type="primary" size="small">编辑</el-button>
          <el-button @click="deleteRecord(scope.row.questionId,scope.row.type)" type="danger" size="small">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pagination.current"
      :page-sizes="[6, 10]"
      :page-size="pagination.size"
      layout="total, sizes, prev, pager, next, jumper"
      :total="pagination.total"
      class="page"
    ></el-pagination>
    <!-- 编辑对话框-->
        <el-dialog
          title="编辑选择题"
          :visible.sync="dialogVisibleMulti"
          width="60%"
          :before-close="handleClose">
          <section class="update">
            <el-form ref="form" :model="form" label-width="80px">
              <el-form-item label="学科">
                  <el-input v-model="form.subject"></el-input>
                </el-form-item>
              <el-form-item label="题目">
                <el-input v-model="form.question"></el-input>
              </el-form-item>
              <el-form-item label="选项A">
                <el-input v-model="form.answerA"></el-input>
              </el-form-item>
              <el-form-item label="选项B">
                <el-input v-model="form.answerB"></el-input>
              </el-form-item>
              <el-form-item label="选项C">
                <el-input v-model="form.answerC"></el-input>
              </el-form-item>
              <el-form-item label="选项D">
                <el-input v-model="form.answerD"></el-input>
              </el-form-item>
              <el-form-item label="正确选项">
                <el-input v-model="form.rightAnswer"></el-input>
              </el-form-item>
              <el-form-item label="分析">
                <el-input v-model="form.analysis"></el-input>
              </el-form-item>
              <el-form-item label="试题分数">
                <el-input v-model="form.score"></el-input>
              </el-form-item>
              <el-form-item label="所属章节">
                <el-input v-model="form.section"></el-input>
              </el-form-item>
              <el-form-item label="难度等级">
                <el-input v-model="form.level"></el-input>
              </el-form-item>
            </el-form>
          </section>
          <span slot="footer" class="dialog-footer">
            <el-button @click="dialogVisibleMulti = false">取 消</el-button>
            <el-button type="primary" @click="submitMulti()">确 定</el-button>
          </span>
        </el-dialog>
        <!-- 编辑对话框-->
                <el-dialog
                  title="编辑填空题"
                  :visible.sync="dialogVisibleFill"
                  width="60%"
                  :before-close="handleClose">
                  <section class="update">
                    <el-form ref="form" :model="form" label-width="80px">
                      <el-form-item label="学科">
                          <el-input v-model="form.subject"></el-input>
                        </el-form-item>
                      <el-form-item label="题目">
                        <el-input v-model="form.question"></el-input>
                      </el-form-item>
                      <el-form-item label="答案">
                        <el-input v-model="form.answer"></el-input>
                      </el-form-item>
                      <el-form-item label="分析">
                        <el-input v-model="form.analysis"></el-input>
                      </el-form-item>
                      <el-form-item label="分数">
                        <el-input v-model="form.score"></el-input>
                      </el-form-item>
                      <el-form-item label="难度等级">
                        <el-input v-model="form.level"></el-input>
                      </el-form-item>
                      <el-form-item label="所属章节">
                        <el-input v-model="form.section"></el-input>
                      </el-form-item>
                    </el-form>
                  </section>
                  <span slot="footer" class="dialog-footer">
                    <el-button @click="dialogVisibleFill = false">取 消</el-button>
                    <el-button type="primary" @click="submitFill()">确 定</el-button>
                  </span>
                </el-dialog>
                <!-- 编辑对话框-->
                        <el-dialog
                          title="编辑判断题"
                          :visible.sync="dialogVisibleJudge"
                          width="60%"
                          :before-close="handleClose">
                          <section class="update">
                            <el-form ref="form" :model="form" label-width="80px">
                              <el-form-item label="学科">
                                  <el-input v-model="form.subject"></el-input>
                                </el-form-item>
                              <el-form-item label="题目">
                                <el-input v-model="form.question"></el-input>
                              </el-form-item>
                              <el-form-item label="答案">
                                <el-input v-model="form.answer"></el-input>
                              </el-form-item>
                              <el-form-item label="分析">
                                <el-input v-model="form.analysis"></el-input>
                              </el-form-item>
                              <el-form-item label="分数">
                                <el-input v-model="form.score"></el-input>
                              </el-form-item>
                              <el-form-item label="难度等级">
                                <el-input v-model="form.level"></el-input>
                              </el-form-item>
                              <el-form-item label="所属章节">
                                <el-input v-model="form.section"></el-input>
                              </el-form-item>
                            </el-form>
                          </section>
                          <span slot="footer" class="dialog-footer">
                            <el-button @click="dialogVisibleJudge = false">取 消</el-button>
                            <el-button type="primary" @click="submitJudge()">确 定</el-button>
                          </span>
                        </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
    form: {}, //保存点击以后当前试卷的信息
      pagination: {
        //分页后的考试信息
        current: 1, //当前页
        total: null, //记录条数
        size: 6 //每页条数
      },
      dialogVisibleMulti: false,
      dialogVisibleFill: false,
      dialogVisibleJudge: false,
    };
  },
  created() {
    this.getAnswerInfo();
  },
  methods: {
    edit(questionId,type) { //编辑试卷
    if(type=="选择题"){
      this.dialogVisibleMulti = true
      this.$axios(`/api/question/${questionId}/${type}`).then(res => { //根据问题id请求后台
        if(res.data.code == 200) {
          this.form = res.data.data
        }
      })
      }
    if(type=="填空题"){
      this.dialogVisibleFill = true
      this.$axios(`/api/question/${questionId}/${type}`).then(res => { //根据问题id请求后台
        if(res.data.code == 200) {
          this.form = res.data.data
        }
      })
      }
    if(type=="判断题"){
          this.dialogVisibleJudge = true
          this.$axios(`/api/question/${questionId}/${type}`).then(res => { //根据问题id请求后台
            if(res.data.code == 200) {
              this.form = res.data.data
            }
          })
          }
    },
    handleClose(done) { //关闭提醒
          this.$confirm('确认关闭？')
            .then(_ => {
              done();
            }).catch(_ => {});
        },
    submitMulti() { //提交修改后的试卷信息
      this.dialogVisibleMulti = false
      this.$axios({
        url: '/api/questionMulti',
        method: 'put',
        data: {
          ...this.form
        }
      }).then(res => {
        if(res.data.code == 200) {
          this.$message({ //成功修改提示
            message: '更新成功',
            type: 'success'
          })
        }
        this.getAnswerInfo()
      })
    },
    submitFill() { //提交修改后的试卷信息
          this.dialogVisibleFill = false
          this.$axios({
            url: '/api/questionFill',
            method: 'put',
            data: {
              ...this.form
            }
          }).then(res => {
            if(res.data.code == 200) {
              this.$message({ //成功修改提示
                message: '更新成功',
                type: 'success'
              })
            }
            this.getAnswerInfo()
          })
        },
        submitJudge() { //提交修改后的试卷信息
              this.dialogVisibleJudge = false
              this.$axios({
                url: '/api/questionJudge',
                method: 'put',
                data: {
                  ...this.form
                }
              }).then(res => {
                if(res.data.code == 200) {
                  this.$message({ //成功修改提示
                    message: '更新成功',
                    type: 'success'
                  })
                }
                this.getAnswerInfo()
              })
            },
    deleteRecord(questionId,type) {
      this.$confirm("确定删除该记录吗,该操作不可逆！！！","删除提示",{
        confirmButtonText: '确定删除',
        cancelButtonText: '算了,留着',
        type: 'danger'
      }).then(()=> { //确认删除
        this.$axios({
          url: `/api/question/${questionId}/${type}`,
          method: 'delete',
        }).then(res => {
          this.getAnswerInfo()
        })
      }).catch(() => {

      })
    },
    getAnswerInfo() {
      //分页查询所有试卷信息
      this.$axios(
        `/api/answers/${this.pagination.current}/${this.pagination.size}`
      )
        .then(res => {
          this.pagination = res.data.data;
          console.log(res);
        })
        .catch(error => {});
    },
    //改变当前记录条数
    handleSizeChange(val) {
      this.pagination.size = val;
      this.getAnswerInfo();
    },
    //改变当前页码，重新发送请求
    handleCurrentChange(val) {
      this.pagination.current = val;
      this.getAnswerInfo();
    },
    tableRowClassName({ row, rowIndex }) {
      if (rowIndex % 2 == 0) {
        return "warning-row";
      } else {
        return "success-row";
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.exam {
  padding: 0px 40px;
  .page {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .edit {
    margin-left: 20px;
  }
  .el-table tr {
    background-color: #DD5862 !important;
  }
}
  .el-table .warning-row {
    background: #000 !important;

  }

  .el-table .success-row {
    background: #DD5862;
  }

</style>
