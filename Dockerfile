FROM centos:7

ENV CI_SERVER_URL=http://gitlab.example.com \
    RUNNER_NAME=gitbook-with-docker \
    RUNNER_EXECUTOR=shell \
    REGISTRATION_TOKEN=my-registration-token \
    REGISTER_NON_INTERACTIVE=true

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
    && yum -y install nodejs \
    && npm install gitbook-cli -g \
    && gitbook -V \
    && curl --silent --location https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash - \
    && yum -y install gitlab-runner \
    && cat /etc/gitlab-runner/config.toml \
    && rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
    && yum -y install nginx \
    && rm -rf /var/cache/yum

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 80

WORKDIR "/home/gitlab-runner"
ENTRYPOINT ["/sbin/entrypoint.sh"]