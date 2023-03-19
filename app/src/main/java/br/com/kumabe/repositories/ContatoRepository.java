package br.com.kumabe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.kumabe.models.Contato;

@Repository
public interface ContatoRepository extends JpaRepository<Contato, Integer> {

}
