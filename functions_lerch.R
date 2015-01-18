
# choix du moyen de contraception par les femmes
#'@param ar array correspondant aux différents choix possibles
#'@usage ar <- d[, 24:32]

choix <- function(ar){
    methode <- c("Aucune", "Pilule", "Stérilet", "Implant", "Patch", "Anneau vaginal", "Préservatif masculin", "Pilule du lendemain", "Autre méthode")
    for(i in 1:ncol(ar)){
        n <- nrow(ar)
        a <- prop.table(table(ar[, i], useNA = "ifany"))
        if(is.na(a[2]))
            a[1] <- 0
        x <- cbind(a[1])
        rownames(x) <- methode[i]
        
        if(i == 1)
            b <- x
        else
            b <- rbind(b, x)
    }
    return(b)
}

# méthode plus simple:
#     x <- 0;for(i in 1:ncol(ar)){t <- mean(!is.na(ar[,i])); x <- x+ t; print(x)}
# 
# principe: on compte le nombre de lignes dont le contenu n'est pas égal à NA. 
# PB: pour le datafrme, le total n'est pas égal à 100% ?




