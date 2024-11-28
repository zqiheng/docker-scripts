FROM cptactionhank/atlassian-confluence:latest
USER root

# 添加中文字体
# RUN apk update  && apk --no-cache add font-adobe-100dpi
# RUN mkdir /usr/share/fonts/win
# ADD yahei.ttf  /usr/share/fonts/win/yahei.ttf
# RUN chmod 777 /usr/share/fonts/win/yahei.ttf  \
#    && fc-cache -fv  && fc-list

# 将代理破解包加入容器
COPY ./config/atlassian-agent.jar /opt/atlassian/confluence/
# 拷贝中文字体.为了减少RUN调用,这里直接放置到已经存在的目录中
COPY ./config/SimSun.ttf /usr/share/fonts/

# 设置启动加载代理包
RUN apk update  && apk --no-cache add font-adobe-100dpi && chmod 777 /usr/share/fonts/SimSun.ttf && fc-cache -fv && fc-list  && apk add --update  graphviz && echo 'export CATALINA_OPTS="-javaagent:/opt/atlassian/confluence/atlassian-agent.jar ${CATALINA_OPTS}"' >> /opt/atlassian/confluence/bin/setenv.sh

