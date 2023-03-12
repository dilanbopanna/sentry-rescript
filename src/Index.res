%%raw(`require("tailwindcss/tailwind.css")`)

let app = switch ReactDOM.querySelector("#app") {
| Some(container) =>
  open ReactDOM.Experimental
  let root = createRoot(container)
  root->render(
    <div className="h-auto flex flex-col ">
      <div className="h-auto flex flex-col"> <Test /> </div>
    </div>,
  )
| None => ()
}
app
