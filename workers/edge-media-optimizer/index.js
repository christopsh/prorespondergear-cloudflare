addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  const url = new URL(request.url)
  const imageURL = url.searchParams.get("url")

  if (!imageURL) {
    return new Response("Missing image URL", { status: 400 })
  }

  return fetch(imageURL, {
    cf: {
      image: {
        width: 800,
        height: 600,
        fit: "cover",
      }
    }
  })
}
