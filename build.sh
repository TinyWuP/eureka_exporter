#!/bin/bash
set -e
TAG=eureka-exporter:v0.1
docker build -t ${TAG} .
