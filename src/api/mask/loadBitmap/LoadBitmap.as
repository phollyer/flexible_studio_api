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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_loadBitmap.html Northcode Help Documentation
	*/
	public class LoadBitmap extends Mask
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var tolerance:int = 0;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var maskColor:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		/**
		* 
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
		*
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