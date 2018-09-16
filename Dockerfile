FROM centos:7

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
    && yum -y install nodejs \
    && npm install gitbook-cli -g \
    && gitbook -V \
    && curl --silent --location https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash - \
    && yum install gitlab-runner \
    && rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
    && yum -y install nginx
    && rm -rf /var/cache/yum