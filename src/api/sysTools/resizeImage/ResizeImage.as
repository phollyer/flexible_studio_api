package api.sysTools.resizeImage
{
	import api.events.sysTools.resizeImage.ResizeImageEvent;

	import api.sysTools.SysTools;

	import api.vos.sysTools.ResizeImageVO;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>destination</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DESTINATION
	*/
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHeight" , type="api.events.SWFStudioEvent")]
	[Event(name="missingQuality" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSource" , type="api.events.SWFStudioEvent")]
	[Event(name="missingWidth" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_resizeImage.html Northcode Help Documentation
	*/
	public class ResizeImage extends SysTools
	{		
		// Required
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var settings:ResizeImageVO = new ResizeImageVO();
		
		/**
		* Constructor for SysTools.ResizeImage()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_resizeImage.html Northcode Help Documentation
		*/
		public function ResizeImage(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param source
		*
		* @param destination
		*
		* @param width
		*
		* @param height
		*
		* @param quality
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_resizeImage.html Northcode Help Documentation
		*/
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