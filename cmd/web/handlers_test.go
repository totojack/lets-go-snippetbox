package main

import (
	"net/http"
	"testing"

	"lucaiovio_snippetbox/internal/assert"
)

func TestPing(t *testing.T) {
	t.Parallel()

	app := newTestApplication(t)

	ts := newTestServer(t, app.routes())
	defer ts.Close()

	res := ts.get(t, "/ping")
	assert.Equal(t, res.status, http.StatusOK)
	assert.Equal(t, res.body, "OK")
}
