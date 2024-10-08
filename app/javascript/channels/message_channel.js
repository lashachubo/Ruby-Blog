import consumer from "channels/consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    console.log("connected")
    },
    received(data) {
    const messages = document.querySelector("#messages")
    console.log(data.table)
    messages.insertAdjacentHTML("beforeend", `<div class = ${data.table.from_current_user ? "sender" : "recipient" }> ${data.table.content}</div>`)
    messages.lastElementChild.scrollIntoView({behavior: "smooth"})
  }
})