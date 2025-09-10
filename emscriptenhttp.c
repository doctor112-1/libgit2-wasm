#include "common.h"
#include "emscripten.h"
#include "git2/errors.h"
#include "git2/sys/transport.h"
#include "smart.h"
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
  git_smart_subtransport_stream parent;
} emscriptenhttp_stream;

typedef struct {
  git_smart_subtransport parent;
  transport_smart *owner;
} emscriptenhttp_subtransport;

static int emscriptenhttp_stream_read(git_smart_subtransport_stream *stream,
                                      char *buffer, size_t buf_size,
                                      size_t *bytes_read) {
  *bytes_read = 0;
  printf("error");
  return 0;
}

static int emscriptenhttp_stream_write(git_smart_subtransport_stream *stream,
                                       const char *buffer, size_t len) {
  printf("error");
  return 0;
}

static void emscriptenhttp_stream_free(git_smart_subtransport_stream *stream) {
  emscriptenhttp_stream *s = (emscriptenhttp_stream *)stream;
  git__free(s);
}

static int emscriptenhttp_stream_alloc(emscriptenhttp_subtransport *t,
                                       emscriptenhttp_stream **stream) {
  emscriptenhttp_stream *s;

  if (!stream)
    return -1;

  s = git__calloc(1, sizeof(emscriptenhttp_stream));
  GIT_ERROR_CHECK_ALLOC(s);

  s->parent.subtransport = &t->parent;
  s->parent.read = emscriptenhttp_stream_read;
  s->parent.write = emscriptenhttp_stream_write;
  s->parent.free = emscriptenhttp_stream_free;

  *stream = s;

  return 0;
}

static int emscriptenhttp_action(git_smart_subtransport_stream **stream,
                                 git_smart_subtransport *subtransport,
                                 const char *url, git_smart_service_t action) {
  emscriptenhttp_subtransport *t = (emscriptenhttp_subtransport *)subtransport;
  emscriptenhttp_stream *s;

  if (emscriptenhttp_stream_alloc(t, &s) < 0)
    return -1;

  return 0;
}

static int emscriptenhttp_close(git_smart_subtransport *subtransport) {
  return 0;
}

static void emscriptenhttp_free(git_smart_subtransport *subtransport) {
  emscriptenhttp_subtransport *t = (emscriptenhttp_subtransport *)subtransport;
  emscriptenhttp_close(subtransport);
  git__free(t);
}

int git_smart_subtransport_http(git_smart_subtransport **out,
                                git_transport *owner, void *param) {
  emscriptenhttp_subtransport *transport;

  GIT_UNUSED(param);

  if (!out)
    return -1;

  transport = git__calloc(1, sizeof(emscriptenhttp_subtransport));
  GIT_ERROR_CHECK_ALLOC(transport);

  transport->owner = (transport_smart *)owner;
  transport->parent.action = emscriptenhttp_action;
  transport->parent.close = emscriptenhttp_close;
  transport->parent.free = emscriptenhttp_free;

  *out = (git_smart_subtransport *)transport;
  return 0;
}
