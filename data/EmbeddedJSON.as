package com.rubberduckygames.data
{
	import flash.utils.ByteArray;
	
	/** @author John Hutchinson of Level X Games
	 * Use as you see fit. You owe me no credit. :)
	 * See http://www.levelxgames.com/2012/08/how-to-embed-json-data
	 * for an example. **/
	public class EmbeddedJSON
	{
		/** Loads Embedded JSON data
		 * @param Embedded Accepts a class which points to the embedded JSON source.
		 * @return Spits out the decoded JSON Object, ready to use */
		public static function load(Embedded:Class):Object
		{
			var bytes:ByteArray = new Embedded() as ByteArray;
			return JSON.parse(bytes.readUTFBytes(bytes.length));
		}
	}
}