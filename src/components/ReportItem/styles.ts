import styled from 'styled-components';

export const Table = styled.table`
    width: 100%;
    background-color: #FFF;
    padding: 20px;
    box-shadow: 0px 0px 5px #CCC;
    border-radius: 10px;
    margin-top: 20px;
    display: flex;
    justify-content: center;
`;

export const TableHeadColumn = styled.th<{ width?: number }>`
    width: ${props => props.width ? `${props.width}px` : 'auto'};
    padding: 10px 0;
    text-align: left;
`;

export const Link = styled.a`
    width: 20%;
    display: flex;
    height: 40px;
    align-items: center;
    padding: 0 5px;
    border: 1px solid #1b5e14;
    border-radius: 5px;
    background-color: #1b5e14;
    color: white;
    cursor: pointer;
    justify-content: center;
    text-decoration: none;

    &:hover {
        background-color: green;
        color: white;
    }
`;