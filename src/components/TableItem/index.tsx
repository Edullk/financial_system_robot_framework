import * as C from './styles';
import { Item } from '../../types/Item';
import { formatDate } from '../../helpers/dateFilter';
import { categories } from '../../data/categories';

type Props = {
    item: Item
}

export const TableItem = ({ item }: Props) => {
    return (
        <C.TableLine id="table_line">
            <C.TableColumn id="table_item_date">{formatDate(item.date)}</C.TableColumn>
            <C.TableColumn>
                <C.Category id={"table_item_category_"+categories[item.category].title} color={categories[item.category].color}>
                    {categories[item.category].title}
                </C.Category>
            </C.TableColumn>
            <C.TableColumn id="table_item_name">{item.title}</C.TableColumn>
            <C.TableColumn>
                <C.Value id="table_item_value" color={categories[item.category].expense ? 'red' : 'green'}>
                    R$ {item.value}
                </C.Value>
            </C.TableColumn>
        </C.TableLine>
    );
}