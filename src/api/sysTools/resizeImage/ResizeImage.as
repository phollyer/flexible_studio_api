package api.sysTools.resizeImage
{
	import flash.events.IEventDispatcher;
	import api.sysTools.SysTools;
	import api.vos.sysTools.ResizeImageVO;
	
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHeight" , type="api.events.SWFStudioEvent")]
	[Event(name="missingQuality" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSource" , type="api.events.SWFStudioEvent")]
	[Event(name="missingWidth" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ResizeImage extends SysTools
	{		
		// Required
		public var settings:ResizeImageVO = new ResizeImageVO();
		
		public function ResizeImage(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function resizeImage( source:String = null , destination:String = null , width:Number = -1 , height:Number = -1 , quality:Number = -1 ):void
		{
			settings.source = compareStrings( source , settings.source );
			settings.destination = compareStrings( destination , settings.destination );
			settings.width = compareNumbers( width , settings.width );
			settings.height = compareNumbers( height , settings.height );
			settings.quality = compareNumbers( quality , settings.quality );
			
			switch( settings.source )
			{
				case null:
					missingSource();
					break;
				default:
					switch( settings.destination )
					{
						case null:
							missingDestination();
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
											switch( settings.quality > -1 )
											{
												case false:
													missingQuality();
													break;
												default:
													ssCore.SysTools.resizeImage( {source:settings.source
																				 ,destination:settings.destination
																				 ,height:settings.height
																				 ,width:settings.width
																				 ,quality:settings.quality} , {callback:actionComplete, errorSTR:"resizeImageError", code:"39007"} );
											}
									}
							}
					}
			}
		}




	}
}