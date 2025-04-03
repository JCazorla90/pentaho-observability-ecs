FROM openjdk:8-jre-slim

RUN apt-get update && apt-get install -y wget unzip && apt-get clean

ENV PENTAHO_HOME=/opt/pdi
WORKDIR $PENTAHO_HOME

RUN wget https://downloads.sourceforge.net/project/pentaho/Data%20Integration/9.4/pdi-ce-9.4.0.0-343.zip && \
    unzip pdi-ce-9.4.0.0-343.zip && \
    rm pdi-ce-9.4.0.0-343.zip

ENV PATH="${PENTAHO_HOME}/data-integration:${PATH}"

WORKDIR /jobs
ENTRYPOINT ["/bin/bash"]
