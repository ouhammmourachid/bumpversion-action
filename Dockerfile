FROM python:3-alpine
LABEL maintainer="Rachid Ouhammou"
LABEL repository="https://github.com/ouhammmourachid/bumpversion-action"
LABEL homepage="https://github.com/ouhammmourachid/bumpversion-action"

# Check to make sure pip is fully upgraded
RUN pip install --no-cache-dir -U pip

# Install bumpversion from pypi - https://pypi.org/project/bumpversion/
RUN pip install --no-cache-dir bumpversion

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
