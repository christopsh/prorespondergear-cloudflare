addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  const url = new URL(request.url)

  const response = await fetch(request)
  const contentType = response.headers.get("content-type")

  if (url.pathname.startsWith("/wp-json/wc/v3/products") && contentType.includes("application/json")) {
    const data = await response.json()

    const modified = data.map(product => ({
      ...product,
      promo_message: "🔥 10% OFF TODAY ONLY 🔥"
    }))

    return new Response(JSON.stringify(modified), {
      headers: { 'Content-Type': 'application/json' }
    })
  }

  return response
}
