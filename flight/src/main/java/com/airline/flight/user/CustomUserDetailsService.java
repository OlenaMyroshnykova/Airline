package com.airline.flight.user;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    public CustomUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username)
            .map(user -> {
                List<GrantedAuthority> authorities = 
                    user.getRoles().stream()
                    .map(role -> new SimpleGrantedAuthority(role.getName()))
                        .collect(Collectors.toList());

                return new User(
                    user.getUsername(),
                    user.getPassword(),
                    authorities
                );
            })
            .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));
    }
}


