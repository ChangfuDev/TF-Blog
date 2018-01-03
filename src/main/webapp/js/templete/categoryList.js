//1.定义模板
const categoryList = Vue.extend({
    template:
    "<div id='list' class=\"list-group\">\n" +
    "    <a v-for=\"item in items\" class=\"list-group-item\">\n" +
    "        <h4 class=\"list-group-item-heading\"><router-link :to=\"articleRoutePath + item.id\">\n" +
    "            {{ item.title }}\n" +
    "        </router-link></h4>\n" +
    "        <span class=\"text-muted\">{{ item.author }}.</span>\n" +
    "    </a>\n" +
    "</div>",
    data: function () {
        return {
            articleRoutePath:articleRoutePath,
            items: null
        }
    },
    created:function () {
        // 组件创建完后获取数据，
        // 此时 data 已经被 observed 了
        this.fetchData()
    },
    watch: {
        // 如果路由有变化，会再次执行该方法
        '$route': 'fetchData'
    },
    methods: {
        fetchData:function(){
            this.items = null;
            var resp = null;
            $.ajax({
                url : 'articleServlet',
                type : 'POST',
                async : false,
                data : {
                    action:'toArticleListForcCid',
                    categoryId:this.$route.params.id
                },
                success : function(data) {
                    resp = $.parseJSON(data);
                },
                error : function() {
                    resp = $.parseJSON(data);
                }
            });
            this.items = resp;
        }
    }
})
