FROM ubuntu:22.04

# Description for the custom action
LABEL repository="https://github.com/lexara-prime-ai/scc_asv"
LABEL maintainer="Skyloom Cloud Computing"
LABEL "com.github.actions.name"="Automatic Semantic Versioning"
LABEL "com.github.actions.description"="Creates new a semantic version string based on the [commit message]"


COPY scripts/* /usr/bin 
# </usr/bin> -> make scripts available to OS [path]
RUN chmod 755 /usr/bin/entrypoint.sh && chmod 755 /usr/bin/versioning.sh && chmod 755 /usr/bin/scc_asv_init.sh

RUN apt update \ 
    && apt install -y git \
    && apt clean

ENTRYPOINT ["/usr/bin/entrypoint.sh"]