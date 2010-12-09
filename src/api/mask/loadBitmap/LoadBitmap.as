package api.mask.loadBitmap
{
	import api.events.mask.loadBitmap.LoadBitmapEvent;

	import api.mask.Mask;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>color</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_COLOR
	*/
	[Event(name="missingMaskColor" , type="api.events.SWFStudioEvent")]
	[Event(name="missingMaskName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingName", type="api.events.SWFStudioEvent")]
	[Event(name="missingColor", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Load a bitmap (BMP) file that will be used as a mask to create shaped windows.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_loadBitmap.html Northcode Help Documentation
	*/
	public class LoadBitmap extends Mask
	{
		// Optional
		/**
		* All colors within the 'tolerance' range will be interpreted as transparent colors. Tolerance values can range from 0 (the color must be an exact match) to 441, which is the 'distance' between #000000 (black) and #ffffff (white).
		*
		* @defaultValue <code>0</code>
		*/
		public var tolerance:int = 0;
		
		// Required
		/**
		* The color that should be removed to create the desired mask i.e. the color that should become transparent. The mask color is specified in '#rrggbb' format.
		*
		* @defaultValue <code>null</code>
		*/
		public var maskColor:String = null;
		/**
		* The name that should be assigned to the new mask, you will need this to enable the mask later.
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		/**
		* The name of the bitmap file to be loaded. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for Mask.LoadBitmap()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_loadBitmap.html Northcode Help Documentation
		*/
		public function LoadBitmap(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Load a bitmap (BMP) file that will be used as a mask to create shaped windows.
		*
		*
		* @param maskName
		*
		* @param color
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_loadBitmap.html Northcode Help Documentation
		*/
		public function loadBitmap( maskName:String = null , color:String = null , filePath:String = null ):void
		{
			name = compareStrings( maskName , name );
			maskColor = compareStrings( color , maskColor );
			path = compareStrings( filePath , path ); 
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					switch( maskColor )
					{
						case null:
							missingColor();
							break;
						default:
							switch( path )
							{
								case null:
									missingPath();
									break;
								default:
									ssCore.Mask.loadBitmap( {name:name , maskColor:maskColor , path:path , tolerance:tolerance}
														   ,{callback:actionComplete, errorSTR:"loadBitmapError", code:"27002"} );
							}
					}
			}
		}


	}
}