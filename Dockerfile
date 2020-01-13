ARG version=dev
FROM ocamlsf/learn-ocaml-client:${version}

USER root

RUN apk add --no-cache \
  curl \
  emacs-nox \
  && mkdir -p -v /learnocaml/bin \
  && chown -v learn-ocaml:learn-ocaml /learnocaml/bin

ENV PATH /learnocaml/bin:${PATH}

ENV LANG C.UTF-8
# ENV LC_ALL C.UTF-8
# ENV LANGUAGE en_US:en

COPY --chown=learn-ocaml:learn-ocaml .emacs /home/learn-ocaml/.emacs

USER learn-ocaml

# Do some automatic Emacs installation/byte-compilation:
RUN emacs --version && emacs --batch -l ${HOME}/.emacs

ENTRYPOINT []
CMD ["/bin/sh"]
