FROM centos:7

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
    && yum -y install nodejs \
    && npm install gitbook-cli -g \
    && gitbook -V \
    && curl --silent -location https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash - \
    && yum install gitlab-runner \
    && rm -rf /var/cache/yum