package rs.biblioteka.biblioteka;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@Entity(name = "knjige")
public class Knjige {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "knjiga_id", nullable = false)
    private Integer id;

    @Column(nullable = false)
    private String naslov;

    @Column(nullable = false)
    private String autor;

    @Column(nullable = false)
    private String zanr;

    @Column(nullable = false)
    private Integer godina_izdanja;

    @Column(unique = true, nullable = false)
    private String isbn;

    @Column(nullable = false)
    private Integer dostupne_kopije;
}
