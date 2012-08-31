/*
 * Copyright (C) 2012 Intel Corporation.
 *
 * Author: Jens Georg <jensg@openismus.com>
 *
 * This file is part of Rygel.
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

/**
 * Data class representing a DLNA profile.
 * It contains the name and the corresponding DLNA mime type.
 *
 * Note: The mime type can deviate from mime types typically used elsewhere.
 */
public class Rygel.DLNAProfile {
    public string mime;
    public string name;

    public DLNAProfile (string name, string mime) {
        this.mime = mime;
        this.name = name;
    }

    /**
     * Compare two DLNA profiles by name
     */
    public static int compare_by_name (DLNAProfile a, DLNAProfile b) {
        return a.name.ascii_casecmp (b.name);
    }
}

/**
 * Base class for the media engine that will contain knowledge about streaming
 * and transcoding capabilites of the media library in use.
 */
public abstract class Rygel.MediaEngine : GLib.Object {
    private static MediaEngine instance;

    /**
     * Get the singleton instance of the currently used media engine.
     *
     * @return An instance of a concreate #MediaEngine implementation.
     */
    public static MediaEngine get_default () {
        if (instance == null) {
            instance = new GstMediaEngine ();
        }

        return instance;
    }

    /**
     * Get a list of the DLNA profiles that are supported by this media
     * engine.
     *
     * @return A list of #DLNAProfile<!-- -->s
     */
    public abstract unowned List<DLNAProfile> get_dlna_profiles ();

    /**
     * Get a list of the Transcoders that are supported by this media engine.
     *
     * @return A list of #Transcoder<!-- -->s or null if not supported.
     */
    public abstract unowned List<Transcoder>? get_transcoders ();
}
