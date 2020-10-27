import React from 'react';
import {Navbar, Nav, NavDropdown} from 'react-bootstrap';
import jwt_decode from 'jwt-decode';
import { useHistory } from "react-router-dom";

const Menu = () => {
    
    const history = useHistory();

    const sair = (event) => {
        event.preventDefault();

        //limpando o token do local storage
        localStorage.removeItem('token-nyous-tarde');

        //levando o usuario deslogado à home
        history.push('/');

    }

    const renderMenu = () => {
    
        const token1 = localStorage.getItem('token-nyous-tarde');

        if(token1 === null){
            return(
                <Nav>
                    <Nav.Link href='/login'>Login</Nav.Link> 
                    <Nav.Link href='/cadastrar'>Cadastrar</Nav.Link> 
                </Nav>
            );
        }else if(jwt_decode(token1).role === 'Admin'){
            return(
                <Nav>
                    <Nav.Link href='/admin/dashboard'>DashBoard</Nav.Link> 
                    <Nav.Link href='/admin/categorias'>Categorias</Nav.Link> 
                    <Nav.Link href='/eventos'>Eventos</Nav.Link> 
                    <NavDropdown title={jwt_decode(token1).family_name} id="basic-nav-dropdown">
                        <NavDropdown.Item href="/perfil">Perfil</NavDropdown.Item>
                        <NavDropdown.Divider />
                        <NavDropdown.Item onClick={event => sair(event)}>Sair</NavDropdown.Item>
                    </NavDropdown>
                </Nav>
            );
        }else{
            return(
                <Nav>
                    <Nav.Link href='/eventos'>Eventos</Nav.Link> 
                    <NavDropdown title={jwt_decode(token1).family_name} id="basic-nav-dropdown">
                        <NavDropdown.Item href="/perfil">Perfil</NavDropdown.Item>
                        <NavDropdown.Divider />
                        <NavDropdown.Item onClick={event => sair(event)}>Sair</NavDropdown.Item>
                    </NavDropdown>
                </Nav>
            )
        }

        
    }

    return(
        <Navbar collapseOnSelect expand='lg' bg='dark' variant='dark'>
           <Navbar.Brand href="/">NYOUS</Navbar.Brand>
           <Navbar.Toggle aria-controls='responsive-navbar-nav'/>
           <Navbar.Collapse id='responsive-navbar-nav'>
            <Nav className='mr-auto'>
                <Nav.Link href='/'>Home</Nav.Link>
            </Nav>   
            
            { renderMenu() }
            </Navbar.Collapse>  
       </Navbar>
    )
}

export default Menu