document.addEventListener('DOMContentLoaded', function() {
    const table = document.getElementById('table')
    
    function fetchKorisnici() {
        fetch('http://localhost:8000/korisnici')
            .then(rsp => rsp.json())
            .then(data => {
                console.log(data)
                table.innerHTML = ''
                data.forEach(korisnik => {
                    const tr = document.createElement('tr')
                    tr.innerHTML = `
                                          
                        <td>${korisnik.korisnickoIme}</td>
                        <td>${korisnik.email}</td>
                        <td>${korisnik.uloga}</td>
                        <td>${new Date(korisnik.datum_kreiranja).toLocaleString('sr-RS')}</td>
                        <td>
                            <div class="btn-group">
                                <a href="#" class="btn btn-sm btn-primary">
                                    <i class="fa-solid fa-pen-to-square"></i> Izmeni
                                </a>
                                <button type="button" class="btn btn-sm btn-danger" onclick="obrisiKorisnika(${korisnik.id})">
                                    <i class="fa-solid fa-trash"></i> Obriši
                                </button>
                            </div>
                        </td>
                    `
                    table.appendChild(tr)
                });
            })
            .catch(error => console.error('Error:', error))
    }
  
    fetchKorisnici();
  
    window.obrisiKorisnika = function (id) {
        if (confirm(`Da li ste sigurni da želite obrisati korisnika sa ID: ${id}?`)) {
            fetch(`http://localhost:8000/korisnici/${id}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Greška prilikom brisanja korisnika')
                }
                fetchKorisnici()
            })
            .catch(error => console.error('Greška prilikom brisanja korisnika:', error))
        }
    }
  })