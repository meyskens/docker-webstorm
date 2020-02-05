FROM meyskens/vscode-maartje

USER root

ENV version 2019.3.2

RUN apt-get update && apt-get install -y git wget tar fish libfontconfig1 libxrender1 libxext6 libxtst6 libxi6

ENV GOPATH /home/user/go
ENV GOROOT /usr/local/go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN wget https://download.jetbrains.com/go/goland-${version}.tar.gz &&\
    tar -xzf goland-${version}.tar.gz && rm -f goland-${version}.tar.gz

RUN chown -R user GoLand-${version}

RUN chsh user -s /usr/bin/fish

USER user

COPY idea.properties GoLand-${version}/bin/

CMD GoLand-${version}/bin/goland.sh
