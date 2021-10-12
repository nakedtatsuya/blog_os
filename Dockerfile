FROM rust:1.52.1

WORKDIR /usr/src/app
COPY . .
RUN rustup override set nightly \ 
    && rustup target add thumbv7em-none-eabihf \
    && rustup component add rust-src \
    && cargo install bootimage \
    && cargo install --path .

CMD ["sh"]