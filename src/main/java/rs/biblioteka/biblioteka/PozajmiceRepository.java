package rs.biblioteka.biblioteka;

import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PozajmiceRepository extends JpaRepository<Pozajmice, Integer> {
}
