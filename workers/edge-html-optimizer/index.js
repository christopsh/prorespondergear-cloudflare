addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  const response = await fetch(request)
  let html = await response.text()

  // Basic HTML minification
  html = html.replace(/>[\s]+</g, '><').trim()

  return new Response(html, {
    headers: { 'Content-Type': 'text/html' }
  })
}
