<%--
  Created by IntelliJ IDEA.
  User: Kirito
  Date: 2019/10/11
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="dbtaobao.connDb,java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  ArrayList<String[]> list = connDb.index();
%>
<html>
  <head>
    <title>$Title$</title>
    <script>
      // 基于准备好的dom，初始化echarts实例
      var myChart = echarts.init(document.getElementById('main'));
      // 指定图表的配置项和数据
      option = {
        backgroundColor: '#2c343c',

        title: {
          text: '所有买家消费行为比例图',
          left: 'center',
          top: 20,
          textStyle: {
            color: '#ccc'
          }
        },

        tooltip : {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
        },

        visualMap: {
          show: false,
          min: 80,
          max: 600,
          inRange: {
            colorLightness: [0, 1]
          }
        },
        series : [
          {
            name:'消费行为',
            type:'pie',
            radius : '55%',
            center: ['50%', '50%'],
            data:[
              {value:<%=list.get(0)[1]%>, name:'特别关注'},
              {value:<%=list.get(1)[1]%>, name:'购买'},
              {value:<%=list.get(2)[1]%>, name:'添加购物车'},
              {value:<%=list.get(3)[1]%>, name:'点击'},
            ].sort(function (a, b) { return a.value - b.value}),
            roseType: 'angle',
            label: {
              normal: {
                textStyle: {
                  color: 'rgba(255, 255, 255, 0.3)'
                }
              }
            },
            labelLine: {
              normal: {
                lineStyle: {
                  color: 'rgba(255, 255, 255, 0.3)'
                },
                smooth: 0.2,
                length: 10,
                length2: 20
              }
            },
            itemStyle: {
              normal: {
                color: '#c23531',
                shadowBlur: 200,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            },

            animationType: 'scale',
            animationEasing: 'elasticOut',
            animationDelay: function (idx) {
              return Math.random() * 200;
            }
          }
        ]
      };

      // 使用刚指定的配置项和数据显示图表。
      myChart.setOption(option);
    </script>
  </head>
  <body>
  $END$
  </body>
</html>
