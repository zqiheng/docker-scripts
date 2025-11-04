#!/bin/bash

DOCKER_FILE_DIR_PREFIX="./dockerfiles"
DOCKER_IMAGE_VERSION="2.1.0-HXSMC"

function build_mycim_oms_foundation() {
    docker build -t mycim-oms-foundation:${DOCKER_IMAGE_VERSION} -f ${DOCKER_FILE_DIR_PREFIX}/OMS-Server-Dockerfile .
}

function build_mycim_oms_ui() {
    docker build -t mycim-oms-ui:${DOCKER_IMAGE_VERSION} -f ${DOCKER_FILE_DIR_PREFIX}/OMS-UI-Dockerfile .
}

function build_mycim_oms_deployment() {
    docker build -t mycim-oms-deployment:${DOCKER_IMAGE_VERSION} -f ${DOCKER_FILE_DIR_PREFIX}/OMS-Deployment-Dockerfile .
}

function build_mycim_mds_foundation() {
    docker build -t mycim-mds-foundation:${DOCKER_IMAGE_VERSION} -f ${DOCKER_FILE_DIR_PREFIX}/MDS-Server-Dockerfile .
}

function build_mycim_mds_ui() {
    docker build -t mycim-mds-ui:${DOCKER_IMAGE_VERSION} -f ${DOCKER_FILE_DIR_PREFIX}/MDS-UI-Dockerfile .
}

function build_mycim_uac_foundation() {
    docker build -t mycim-uac-foundation:${DOCKER_IMAGE_VERSION} -f ${DOCKER_FILE_DIR_PREFIX}/UAC-Server-Dockerfile .
}

function build_mycim_uac_ui() {
    docker build -t mycim-uac-ui:${DOCKER_IMAGE_VERSION} -f ${DOCKER_FILE_DIR_PREFIX}/UAC-UI-Dockerfile .
}

function build_all() {
  # OMS
  build_mycim_oms_foundation
  build_mycim_oms_ui
  build_mycim_oms_deployment

  # MDS
  build_mycim_mds_foundation
  build_mycim_mds_ui

  # UAC
  build_mycim_uac_foundation
  build_mycim_uac_ui
}

function build_all_backend_images() {
  # OMS
  build_mycim_oms_foundation
  build_mycim_oms_deployment

  # MDS
  build_mycim_mds_foundation

  # UAC
  build_mycim_uac_foundation
}


#########################################################
### 菜单定义
#########################################################
function menu() {
cat << EOF

请选择构建的服务...

0. 构建所有后端服务镜像 （包括 oms、mds、uac server）

1. 构建所有服务前后端镜像（包括 oms、mds、uac server/ui）

2. 构建 OMS Foundation Server 服务镜像

3. 构建 OMS UI 镜像

4. 构建 OMS Deployment 服务镜像

5. 构建 MDS Foundation Server 服务镜像

6. 构建 MDS UI 镜像

7. 构建 UAC Foundation Server 服务镜像

8. 构建 UAC UI 镜像

q. exit (退出程序，输入：q/quit/exit)

EOF
}

# 主函数
menu
while true; do
    read -r -p "Input choose number: " main_input
    case $main_input in
    0)
      build_all_backend_images
      break
      ;;
    1)
      build_all
      break
      ;;
    2)
      build_mycim_oms_foundation
      break
      ;;
    3)
      build_mycim_oms_ui
      break
      ;;
    4)
      build_mycim_oms_deployment
      break
      ;;
    5)
      build_mycim_mds_foundation
      break
      ;;
    6)
      build_mycim_mds_ui
      break
      ;;
    7)
      build_mycim_uac_foundation
      break
      ;;
    8)
      build_mycim_uac_ui
      break
      ;;
    q | quit | exit)
      echo -e "[INFO] exit...\n"
      exit
      ;;
    esac
done

echo -e "[INFO] execute success, exit scripts...\n"
