#!/bin/bash
set -e

/local/bin/wait-for-it.sh app:1215 -t 600;
nginx -g 'daemon off;';
