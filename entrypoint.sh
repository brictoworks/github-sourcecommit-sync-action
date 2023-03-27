#!/bin/sh

set -ue

RepositoryUrl="${INPUT_REPOSITORY_URL}"
SSHPrivateKey="${INPUT_SSH_PRIVATE_KEY}"
SSHKey="${INPUT_SSH_KEY}"
HostUrl="${INPUT_HOST_URL}"

## SSH Key Setup
echo "Setting up SSH key"
mkdir -p /root/.ssh
echo "${SSHPrivateKey}" | sed 's/\\n/\n/g' > /root/.ssh/id_sourcecommit

chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_sourcecommit

echo "Host ${HostUrl}
User ${SSHKey}
IdentityFile ~/.ssh/id_sourcecommit" >> /root/.ssh/config
ssh-keyscan -H "${HostUrl}" >> /root/.ssh/known_hosts


mkdir -p ~/.ssh
cp /root/.ssh/* ~/.ssh/ 2> /dev/null || true 

echo "Setting up SSH key Done!"

## Sync Repo

echo "Syncing repository"
git remote add sync ssh://${RepositoryUrl#ssh://}
git push sync --mirror
echo "Syncing repository Done!"
