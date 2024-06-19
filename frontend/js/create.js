document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('createKorisnikForm')

    form.addEventListener('submit', function (event) {
        event.preventDefault()

        const korisnik = {
            korisnickoIme: document.getElementById('name').value,
            email: document.getElementById('email').value,
            uloga: document.getElementById('role').value,
        };
        fetch("http://localhost:8000/korisnici", {
            method: "POST",
            headers: {
              "Content-Type": "application/json"
            },
            body: JSON.stringify(korisnik)
          })
            .then(response => {
              console.log("Raw response:", response)
              if (response.ok) {
                return response.json()
              } else {
                return response.json().then(errorData => {
                  console.error("Greška prilikom dodavanja korisnika:", errorData)
                  throw new Error("Greška prilikom dodavanja korisnika.")
                })
              }
            })
            .then(data => {
              console.log("Korisnik added successfully:", data)
              korisnikForm.reset()
              window.location.href = "index.html"
            })
            .catch(error => console.error("Greška prilikom dodavanja korisnika:", error))
        })
    })