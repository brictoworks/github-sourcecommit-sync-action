# github-sourcecommit-sync-action

A GitHub Action for syncing between Github and NCP SourceCommit Using SSH 

### Input (Use [Github Settings > Security > Secrets and variables] )
- Enter remote url
ex: `ssh://devtools.ncloud.com/<givennumber>/<repositoryname>.git`
- Enter ssh_private_key created on Local Machine 
- Enter the ssh_key created in ncloud through the above private_key
- Enter host url
default: `devtools.ncloud.com`

### Usage
```
name: github-sourcecommit-sync

on:
  push:
    tags-ignore:
      - '*'
    branches:
      - '*'

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - name: Sync up to SourceCommit
        uses: brictoworks/github-sourcecommit-sync-action@master
        with:
          repository_url: ${{ secrets.TEST_REPOSITORY_URL }}
          ssh_private_key: ${{ secrets.TEST_SSH_PRIVATE_KEY }}
          ssh_key: ${{ secrets.TEST_SSH_KEY }}
```