FROM meyskens/vscode-maartje

USER root

ENV version 2020.2.1
RUN apt-get update && apt-get install -y git wget tar fish libfontconfig1 libxrender1 libxext6 libxtst6 libxi6

RUN wget https://download.jetbrains.com/webstorm/WebStorm-${version}.tar.gz &&\
    tar -xzf WebStorm-${version}.tar.gz && rm -f WebStorm-${version}.tar.gz
RUN chown -R user WebStorm-${version}

RUN chsh user -s /usr/bin/fish

USER user

COPY idea.properties WebStorm-${version}/bin/

CMD WebStorm-${version}/bin/webstorm.sh
