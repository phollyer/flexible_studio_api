package api.sysTools.convertIconToJpeg
{
	import flash.events.IEventDispatcher;
	import api.sysTools.SysTools;
	import api.vos.sysTools.ConvertIconToJpegVO;
	
	[Event(name="missingHeight" , type="api.events.SWFStudioEvent")]
	[Event(name="missingJpeg" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingWidth" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ConvertIconToJpeg extends SysTools
	{
		// Required
		public var settings:ConvertIconToJpegVO = new ConvertIconToJpegVO();
		
		public function ConvertIconToJpeg(target:IEventDispatcher=null)
		{
			super(target);
		}
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