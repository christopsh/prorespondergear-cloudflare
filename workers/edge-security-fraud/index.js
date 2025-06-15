addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

const BAD_BOTS = ["curl", "wget", "python", "scrapy", "nmap"]

async function handleRequest(request) {
  const ua = request.headers.get("user-agent") || ""

  for (let bot of BAD_BOTS) {
    if (ua.toLowerCase().includes(bot)) {
      return new Response("Access denied", { status: 403 })
    }
  }

  return fetch(request)
}
