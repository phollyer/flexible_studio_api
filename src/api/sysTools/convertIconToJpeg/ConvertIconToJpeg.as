package api.sysTools.convertIconToJpeg
{
	import api.events.sysTools.convertIconToJpeg.ConvertIconToJpegEvent;

	import api.sysTools.SysTools;

	import api.vos.sysTools.ConvertIconToJpegVO;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>height</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_HEIGHT
	*/
	[Event(name="missingHeight" , type="api.events.SWFStudioEvent")]
	[Event(name="missingJpeg" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingWidth" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_convertIconToJpeg.html Northcode Help Documentation
	*/
	public class ConvertIconToJpeg extends SysTools
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var settings:ConvertIconToJpegVO = new ConvertIconToJpegVO();
		
		/**
		* Constructor for SysTools.ConvertIconToJpeg()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_convertIconToJpeg.html Northcode Help Documentation
		*/
		public function ConvertIconToJpeg(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param path
		*
		* @param width
		*
		* @param height
		*
		* @param jpeg
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_convertIconToJpeg.html Northcode Help Documentation
		*/
		public function convertIconToJpeg( path:String = null , width:Number = -1 , height:Number = -1 , jpeg:String = null ):void
		{
			settings.path = compareStrings( path , settings.path );
			settings.width = compareNumbers( width , settings.width );
			settings.height = compareNumbers( height , settings.height );
			settings.jpeg = compareStrings( jpeg , settings.jpeg );
			
			switch( settings.path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( settings.jpeg )
					{
						case null:
							missingJpeg();
							break;
						default:
							switch( settings.width > -1 )
							{
								case false:
									missingWidth();
									break;
								default:
									switch( settings.height > -1 )
									{
										case false:
											missingHeight();
											break;
										default:
											ssCore.SysTools.convertIconToJpeg( settings
																			 ,{callback:actionComplete, errorSTR:"convertIconToJpegError", code:"39000"} );
									}
							}
					}
			}
		}



	}
}