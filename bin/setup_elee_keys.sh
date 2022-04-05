#!/bin/bash
# Clear existing keys
ssh-add -D

# do stuff
ssh-add -K ~/.ssh/id_ed_elee_sm_gigan
ssh-add -K ~/.ssh/id_ed_eul_gigan
ssh-add -K ~/.ssh/id_rsa
ssh-add -K ~/.ssh/id_rsa_elee_sm
