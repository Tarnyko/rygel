/*
 * Copyright (C) 2012 Openismus GmbH
 *
 * Author: Krzesimir Nowak <krnowak@openismus.com>
 *
 * Rygel is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Rygel is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

using GUPnP;
using Gee;

internal class Rygel.LastChangeObjAdd : Rygel.LastChangeEntry {
    private bool sub_tree_update;
    private string parent_id;
    private string upnp_class;

    public LastChangeObjAdd (string id,
                             uint update_id,
                             bool sub_tree_update,
                             string parent_id,
                             string upnp_class) {
        base ("objAdd", id, update_id);
        this.sub_tree_update = sub_tree_update;
        this.parent_id = parent_id;
        this.upnp_class = upnp_class;
    }

    protected override string additional_info () {
        var str = new StringBuilder ();
        var st_update = (this.sub_tree_update ? "1" : "0");

        str.append ("stUpdate=\"" + st_update + "\" " +
                    "objParentID=\"" + this.parent_id + "\" " +
                    "objClass=\"" + this.upnp_class + "\"");

        return str.str;
    }
}
