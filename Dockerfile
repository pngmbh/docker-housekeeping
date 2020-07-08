FROM docker:18.09

ENV PERIOD=15min
ENV PERIODIC_DIR=/etc/periodic

RUN mkdir -p "${PERIODIC_DIR}/1min"

# setup */1 minute cronjobs
RUN echo "*       *       *       *       *       run-parts ${PERIODIC_DIR}/1min" >> /etc/crontabs/root

ADD run-docker-system-prune.sh ${PERIODIC_DIR}/${PERIOD}/run-docker-system-prune
