document.addEventListener('DOMContentLoaded', function() {
    const params = new URLSearchParams(window.location.search)
    const id = params.get('id')
  
    if (id == null || id === '') {
      alert('Korisnik nije pronađen')
      window.location.href = 'index.html'
      return
    }
  
    fetch('http://localhost:8000/api/korisnici/' + id)
      .then(rsp => {
        if (rsp.status === 200) {
          return rsp.json()
        } else {
          throw new Error('Korisnik nije pronađen')
        }
      })
      .then(data => {
        document.getElementById('id').value = data.id
        document.getElementById('name').value = data.korisnickoIme
        document.getElementById('email').value = data.email
        document.getElementById('role').value = data.uloga
        document.getElementById('created').value = new Date(data.datum_kreiranja).toLocaleString('sr-RS')
      })
      .catch(error => {
        alert(error.message)
        window.location.href = 'index.html'
      })
  })