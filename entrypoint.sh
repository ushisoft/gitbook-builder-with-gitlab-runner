#!/bin/bash

# start nginx service
nginx

# run gitlab-runner
gitlab-runner register
gitlab-runner run