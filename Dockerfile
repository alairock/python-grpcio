FROM python:3.8-alpine

ENV PYTHONPATH=./.pip:/app/.pip:.: \
    DOCKER=True

ENV PATH="/root/.poetry/bin:/root/.cache/pypoetry/virtualenvs:$PATH"

RUN apk add --no-cache -u\
    bash \
    curl \
    git \
    postgresql-dev \
    gcc \
    make \
    libffi-dev \
    libsodium \
    openssh-client \
    g++ \
    musl-dev && \
    python3 -m pip install grpcio && \
    python3 -m pip install -U \
        dumb-init \
        pip && \
    mkdir /app && \
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | POETRY_PREVIEW=1 python - -y

RUN rm -rf /var/cache/apk/*

