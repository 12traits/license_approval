FROM ruby:2.6-alpine


RUN apk add --no-cache git make musl-dev go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

# Install license_finder
RUN mkdir -p /var/license_action/
WORKDIR /var/license_action/
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --system

COPY script.sh script.sh

ENTRYPOINT ["/var/license_action/script.sh"]

