FROM python:3-alpine
LABEL maintainer="Rachid Ouhammou"
LABEL repository="https://github.com/ouhammmourachid/bumpversion-action"
LABEL homepage="https://github.com/ouhammmourachid/bumpversion-action"


# Install our pre-reqs
RUN apk add --no-cache git bash curl jq

# Check to make sure pip is fully upgraded
RUN pip install --no-cache-dir -U pip


RUN pip install --no-cache-dir bumpver openssh-client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
